import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/model/data_model.dart';

abstract class AppCubitStates extends Equatable{}

class InitialState extends AppCubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeState extends AppCubitStates
{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadingState extends AppCubitStates
{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadedState extends AppCubitStates
{
  final List<DataModel>places;
  LoadedState(this.places);
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends AppCubitStates
{
  final DataModel place;
  DetailState(this.place);
  @override
  // TODO: implement props
  List<Object> get props => [place];
}